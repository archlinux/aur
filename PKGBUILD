# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vim-skeleton
pkgver=0.0.3.r0.g7309644
pkgrel=8
pkgdesc="Vim plugin: Skeleton for newly created buffers"
arch=('any')
url="https://github.com/kana/vim-skeleton"
license=('GPL')
depends=('vim')
makedepends=('git')
install=vim-skeleton.install
source=('git://github.com/kana/vim-skeleton.git'
	'skeleton-c'
	'skeleton-h'
	'skeleton-html'
	'skeleton-perl'
	'skeleton-sh')
sha256sums=('SKIP'
            '3e4c3ee99b954a71493117b02fb331c7f351fab51aaea9ed2c84787012538630'
            'b629086dc2208711268f05b26508393e602c0111585ae6f8d1ed773a09f72cd6'
            '9af84b93ddf9a04a0c608cce0a8838f20e9c5c8ca7668b33e0b5ec44115d799a'
            '70bba951dc6fdca3e2f8354ebb157372a8cc0e84670168b411a62532929c9a04'
            '052ef4da82553141d8c65af51ffe082cd322f0dbad96b17c7240bbe5b1849ac3')

pkgver() {
	cd vim-skeleton/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	install -D -m0644 ${srcdir}/vim-skeleton/plugin/skeleton.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/skeleton.vim
	install -D -m0644 ${srcdir}/vim-skeleton/doc/skeleton.txt ${pkgdir}/usr/share/doc/${pkgname}/skeleton.txt

	for SKELETON in c h html perl sh; do
		install -D -m0644 ${srcdir}/skeleton-${SKELETON} ${pkgdir}/usr/share/vim/vimfiles/xtr/skeleton/${SKELETON}
	done
}

