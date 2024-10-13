# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=vmware-ovftool
pkgver=4.6.3.24031167
pkgrel=1
pkgdesc="VMware Open Virtualization Format tool"
arch=('x86_64')
url="https://developer.broadcom.com/tools/open-virtualization-format-ovf-tool/latest"
license=('LicenseRef-eula')
depends=('expat' 'openssl' 'xerces-c' 'icu60')
# VMware-ovftool must be provided by the user by putting it into the build directory
# You can get the file by yourself here:
# https://developer.broadcom.com/tools/open-virtualization-format-ovf-tool/latest
source=("file://VMware-ovftool-${pkgver%.*}-${pkgver##*.}-lin.x86_64.zip")
sha256sums=('344c30826121fe6ad990c32123e2aaf9261d777309d3e2012dd521775fa43e8c')

package() {
  cd "ovftool"
  # Install binaries files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" \
    libgoogleurl.so.59 libssoclient.so libvmacore.so libvmomi.so \
    libvim-types.so ovftool ovftool.bin
  # Install data files
  for _subdir in "certs" "env" "env/en" "schemas/DMTF" "schemas/vmware"
  do
    install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/${_subdir}"
    install -m 644 -t "${pkgdir}/usr/lib/${pkgname}/${_subdir}" "${_subdir}"/*.*
  done
  # Install main script symlink
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/ovftool" "${pkgdir}/usr/bin/ovftool"
  # Install license files
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "vmware.eula" "vmware-eula.rtf" "open_source_licenses.txt"
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.txt"
}
