# Maintainer:  Spacingbat3 <SpacingBat3 at github.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: StaCk <proc.null at gmail dot com>

pkgname=funny-manpages-git
pkgver=r26.a3e0b08
pkgrel=1
pkgdesc="A set of miscellaneous humorous manpages (don't take them too seriously!). Git master repo."
arch=('any')
url="https://github.com/ltworf/funny-manpages"
license=('custom')
depends=('man-db' 'git')
provides=('funny-manpages')
conflicts=('funny-manpages')

_gitname=funny-manpages

source=("git+https://github.com/ltworf/funny-manpages.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$_gitname/man
    for f in *.[0-57-9]fun ; do
        mv $f ${f/.?fun/.6fun}
    done
}

package() {
	# Make installed files visible for pamac
	for i in `ls -w0 $srcdir/$_gitname/man/*.6fun`; do
	install -Dm644 "$i" "${pkgdir}/usr/share/man/man6/`basename $i`"
	done
	install -Dm644 "$srcdir/$_gitname/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
