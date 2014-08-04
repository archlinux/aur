pkgname=urxvt-tabbedex-git
pkgver=0.4.r9.g49c1514
pkgrel=1

pkgdesc="A tabbed extension for rxvt-unicode with several enhancements"
url='http://github.com/stepb/urxvt-tabbedex'
arch=("any")
license=("GPL")

depends=('rxvt-unicode')
makedepends=('git')

provides=('urxvt-tabbedex')
conflicts=('urxvt-tabbedex')

install=urxvt-tabbedex-git.install

source=('git+https://github.com/stepb/urxvt-tabbedex.git'
        '0001-make-urxvt-tabbedex-work-with-perl-5.18.patch'
        'urxvt-tabbedex-git.install')
md5sums=('SKIP'
         '92d581a40779da3127c88fdc7d10257f'
         '6ea57fa7db9cc912b3759f1ef8c064b0')

pkgver() {
	cd urxvt-tabbedex
	git describe --tags --long | sed 's/^tabbedex-//; s/-/-r/; s/-/./g'
}

prepare() {
	cd urxvt-tabbedex
	git apply ../0001-make-urxvt-tabbedex-work-with-perl-5.18.patch
}

package() {
	install -Dm644 urxvt-tabbedex/tabbedex "$pkgdir"/usr/lib/urxvt/perl/tabbedex
}
