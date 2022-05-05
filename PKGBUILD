# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
pkgname=aurbuilder-git
pkgver=r10.768958c
pkgrel=1
pkgdesc="Build AUR packages on EC2"
url="https://github.com/nikicat/archbuilder"
arch=('any')
license=('GPL')
depends=(aws-cli-v2 docker openssh)
source=('git+https://github.com/nikicat/archbuilder')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/archbuilder"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/archbuilder"
        install -Dm755 run.sh "$pkgdir"/usr/bin/aurbuild
        install -Dm644 spot-options.json "$pkgdir"/usr/share/aurbuild/spot-options.json
}
