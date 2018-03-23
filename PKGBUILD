# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=sqlops
pkgver=0.27.0
pkgrel=1
pkgdesc="SQL Operations Studio is a data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW from Windows, macOS and Linux."
arch=('x86_64')
url="https://github.com/Microsoft/sqlopsstudio"
license=('custom: microsoft')
depends=('fontconfig' 'libxtst' 'gtk2' 'python' 'cairo' 'alsa-lib' 'nss' 'gcc-libs' 'glibc' 'libxss' 'gconf' 'libxkbfile' 'libunwind' 'libsecret' 'curl')
optdepends=('krb5: Windows authentication support')
options=('staticlibs')
source=("https://github.com/Microsoft/sqlopsstudio/releases/download/${pkgver}/sqlops-linux-${pkgver}.tar.gz"
	'sqlops.desktop')
sha256sums=('f272acf63eaf4393e89ed086f5f5a98a4cd9b85295055f465b30c1a4cd3b817d'
            'b5ad95bef9b56aba179c642e0edac04c32aa8cb3c4c0428cf0257119995e1dc2')

package() {
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r "${srcdir}/sqlops-linux-x64/"* "${pkgdir}/usr/share/${pkgname}"

  # Symlink the startup script in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/bin/sqlops" "${pkgdir}/usr/bin/sqlops"

  # Add the .desktop file
  install -D -m644 "${srcdir}/sqlops.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install the license file
  install -D -m644 "${srcdir}/sqlops-linux-x64/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
