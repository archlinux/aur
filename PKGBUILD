# Maintainer: Hans-Nikolai Viessmann <hv15@hw.ac.uk>
_project=sshprint
pkgname=$_project
pkgver=2.04
pkgrel=1
pkgdesc="A Perl script to print local files on remote printers using SSH"
arch=('any')
url="https://github.com/hv15/$_project"
license=('MIT')
depends=('perl>=5.22.0' 'openssh' 'perl-log-log4perl' 'perl-config-simple' 'perl-net-openssh')
conflicts=('sshprint<=1.6.3')
options=(!emptydirs)
changelog='CHANGELOG.md'
install=sshprint.install
source=("https://github.com/hv15/${_project}/archive/${pkgver}.tar.gz")
md5sums=('8790659a28cb4e64fc16b860f3e6e38f')

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"

  # place the doc
  install -d "${pkgdir}/usr/share/doc/sshprint"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/sshprint/README"
  install -Dm644 "config.examples/config.example" "${pkgdir}/usr/share/doc/sshprint/config.example"
  install -Dm644 "config.examples/server_config.example" "${pkgdir}/usr/share/doc/sshprint/server_config.example"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # place Perl script and module
  perl Build install
}

# vim:set ts=2 sw=2 et:
