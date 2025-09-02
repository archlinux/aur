# Maintainer Max Harmathy <harmathy@secure.mailbox.org>
# Contributor C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor Patrick McCarty <pnorcks at gmail dot com>

pkgname=git-buildpackage
pkgver=0.9.38
pkgrel=2
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
sha256sums=('4d84c21466ff3dee0904fb57633ef2e58d8e3c8fb6b752a22c846ffed9f2d646')

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
