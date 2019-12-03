# Maintainer: An Nguyen (stk) <an@linux.com>
# Original Maintainer: George Angelopoulos <george@usermod.net>
# Original Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Original Maintainer: dront78 <dront78@gmail.com>
pkgname=systemtap
pkgver=4.2
pkgrel=1
pkgdesc="Infrastructure to simplify the gathering of information about the running Linux system"
url="http://sourceware.org/systemtap/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('elfutils' 'nss' 'python2' 'cpio')
makedepends=('python2-setuptools' 'xmlto')
optdepends=('sqlite3: for storing results in a database')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz.asc"
        )
sha512sums=('50d426e8c3d976fd635f6867fb4202832be455d869178a384159d1b2cd2a25642b07da2bd3184081b13bfb95df48a97f430b06713eaee0d0f67e27f43266cfd6'
            'ddb3217d9bbe7b9531b3d7ce24d88766e65629bd720228c0f8f96edc82216e13e5f0d0f30c8012cb85bf5ac7401f5a551aa69fc0505a29475ed61c548b4cdcf4')
install='systemtap.install'
validpgpkeys=('F75E6545B9F8AA15AA932A444DE16D68FDBFFFB8')  # "Serhei Makarov (for Red Hat 2018..onwards) <smakarov@redhat.com>" 

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/"${pkgname}" \
    --libdir=/usr/lib/"${pkgname}" \
    --mandir=/usr/share/man/ \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-pie \
    --disable-docs \
    --enable-htmldocs
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rmdir "${pkgdir}/var/run/stap-server/"
  rmdir "${pkgdir}/var/run/"
  rm -r "${pkgdir}/usr/include"
}
