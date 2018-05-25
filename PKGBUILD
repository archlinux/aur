# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=sqlops
pkgver=0.29.3
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
sha256sums=('1524033eb1a5f6b12459ec5a9156a974a719195b959a12e6a64fa646a1b6b4d3'
            'b5ad95bef9b56aba179c642e0edac04c32aa8cb3c4c0428cf0257119995e1dc2')

package() {
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r "${srcdir}/sqlops-linux-x64/"* "${pkgdir}/usr/share/${pkgname}"

  # Symlink the SQL Service package as Unknown to workaround distro detection issues
  ln -s "./Linux" "${pkgdir}/usr/share/${pkgname}/resources/app/extensions/mssql/sqltoolsservice/Unknown"

  # Symlink the startup script in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/bin/sqlops" "${pkgdir}/usr/bin/sqlops"

  # Add the .desktop file
  install -D -m644 "${srcdir}/sqlops.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install the license file
  install -D -m644 "${srcdir}/sqlops-linux-x64/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
