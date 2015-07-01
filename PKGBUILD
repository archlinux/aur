# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Chris Sakalis <chrissakalis@gmail.com>

pkgname=vim-unimpaired-git
pkgver=20141014
pkgrel=1
pkgdesc="Complementary pairs of mappings for various common operations."
arch=('any')
url="https://github.com/tpope/vim-unimpaired"
license=('custom:vim')
depends=("vim")
makedepends=("git")
provides=("vim-unimpaired")
conflicts=("vim-unimpaired")
groups=('vim-plugins')
source=('git+https://github.com/tpope/vim-unimpaired.git')
install=vimdoc.install
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver()
{
	cd "$srcdir/vim-unimpaired"
	git show -s --format="%ci" HEAD | cut -f1 -d" " | sed 's\[- :]\\g'
}

package()
{
  cd vim-unimpaired
	install -d ${pkgdir}/usr/share/{vim/vimfiles/{doc,plugin},licenses/${pkgname}}
	install -Dm644 doc/unimpaired.txt ${pkgdir}/usr/share/vim/vimfiles/doc/unimpaired.txt
	install -Dm644 plugin/unimpaired.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/unimpaired.vim
	sed -n '/## License/,${s/^\w/\0/;T;s/  / /g;p}' ${srcdir}/vim-unimpaired/README.markdown \
    > ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
