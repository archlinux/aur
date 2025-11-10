# Maintainer Max Harmathy <harmathy@secure.mailbox.org>
# Contributor C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor Patrick McCarty <pnorcks at gmail dot com>

pkgname=git-buildpackage
pkgver=0.9.39
pkgrel=1
pkgdesc="Tools from Debian to integrate the package build system with Git"
arch=(any)
url="https://honk.sigxcpu.org/piki/projects/git-buildpackage/"
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'git'
  'python-dateutil'
  'python-importlib-metadata'
  'python-notify2'
  'python-requests'
  'python-setuptools'
  'python-yaml'
  'python'
  'rpm-tools'
)

makedepends=(
  'dpkg'
  'python-coverage'
  'python-distribute'
  'python-mock'
  'python-nose'
  'python-nosexcover'
  'python-pytest-cov'
  'python-pytest'
)

#checkdepends=('devscripts'
#              'pristine-tar'
#	      'cpio'
#	      'unzip'
#	      'zipmerge'
#	      'curl'
#	      'python-requests'
#	      'debhelper')

backup=('etc/git-buildpackage/gbp.conf')
source=("git+https://github.com/agx/git-buildpackage.git#tag=debian/$pkgver")
sha256sums=('e79d31eb2c87c1604a2a92f884b26989b111e722f9d2310be17be0e2c9e3f39f')

build() {
  cd git-buildpackage
  python setup.py build
}


#check() {
#  cd git-buildpackage
#  python setup.py check
#}

package() {
  cd git-buildpackage/
  python setup.py install --root="$pkgdir" --prefix=/usr -O1
  install -m 644 -D -T "gbp.conf" "$pkgdir/etc/git-buildpackage/gbp.conf"
  install -m 644 -D -T debian/gbp.completion "$pkgdir/usr/share/bash-completion/completions/gbp"
}
