# Maintainer: Jacek Danecki <gmail j a c e k . m . d a n e c k i>
# Contributor: Enihcam <gmail n a n e r i c w a n g>

pkgname=compute-runtime-bin
pkgver=18.42.11702
pkgrel=1
pkgdesc='Intel(R) Graphics Compute Runtime for OpenCL(TM). Replaces Beignet for Gen8 (Broadwell) and beyond (binary version)'
arch=(x86_64)
url='https://github.com/intel/compute-runtime'
license=(MIT)
install=${pkgname}.install
depends=(intel-gmmlib zlib ncurses5-compat-libs)
optdepends=(libdrm libva ocl-icd)
provides=(opencl-driver compute-runtime)
conflicts=(beignet compute-runtime)
source=(${url}/releases/download/${pkgver}/intel-opencl_${pkgver}_amd64.deb)
sha256sums=('3f9c155fe259022679ffb6617023ddc48d1563860e1986747db717170653a741')

package() {
    tar -xJC "${pkgdir}" -f data.tar.xz
    rm -f ${pkgdir}/usr/local/lib/libigdgmm.so
    chmod 755 ${pkgdir}/usr/local/lib/*.so
    chown root:root ${pkgdir}/usr/local/lib/*.so
    mv ${pkgdir}/usr/local/lib ${pkgdir}/usr/
    rm -fr ${pkgdir}/usr/local
    sed -i 's/\/usr\/local\/lib/\/usr\/lib/gI' ${pkgdir}/etc/ld.so.conf.d/libintelopencl.conf
    sed -i 's/\/usr\/local\/lib/\/usr\/lib/gI' ${pkgdir}/etc/OpenCL/vendors/intel.icd
}
