# Maintainer Max Harmathy <harmathy@secure.mailbox.org>
# Contributor C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor Patrick McCarty <pnorcks at gmail dot com>

pkgname=git-buildpackage
pkgver=0.9.37
pkgrel=1
pkgdesc="Tools from Debian to integrate the package build system with Git"
arch=(any)
url="https://honk.sigxcpu.org/piki/projects/git-buildpackage/"
license=('GPL-2.0-or-later')
depends=('git'
         'man'
         'python'
         'python-dateutil'
         'rpm-tools')

makedepends=('python-distribute'
             'python-coverage'
	     'python-mock'
	     'python-nose'
	     'python-nosexcover'
	     'python-setuptools'
	     'dpkg')

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
sha256sums=('865cfde8f0d273c878f3c3002dac916747c1a74fa1eae81497d0ea43b5f230ce')

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
