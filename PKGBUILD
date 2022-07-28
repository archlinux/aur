# Maintainer: ayrton @linux.com
# Developer: pheiduck @forum.manjaro.org

pkgname=manjaro-zsh-config-git
_pkgname=manjaro-zsh-config
pkgver=r71.76d3e1a
pkgrel=1
pkgdesc="Zsh configuration from manjaro forked for all the cool kids"
arch=(any)
url="https://github.com/ayr-ton/$_pkgname"
license=('MIT')
conflicts=('grml-zsh-config')
depends=('zsh-autosuggestions'
	'zsh-syntax-highlighting'
	'zsh-completions'
	'zsh-history-substring-search'
	'zsh'
	'pkgfile'
	'nerd-fonts-noto-sans-mono'
	'zsh-theme-powerlevel10k')
makedepends=('git')
provides=(${pkgname}=$pkgver)
conflicts=(${pkgname%-*})
source=($_pkgname::git+https://github.com/ayr-ton/${_pkgname}.git)
sha256sums=('SKIP')
backup=(root/.zshrc)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${srcdir}
	install -D -m644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 ${srcdir}/${_pkgname}/.zshrc ${pkgdir}/etc/skel/.zshrc
	install -D -m644 ${srcdir}/${_pkgname}/manjaro-zsh-config ${pkgdir}/usr/share/zsh/manjaro-zsh-config
	install -D -m644 ${srcdir}/${_pkgname}/manjaro-zsh-prompt ${pkgdir}/usr/share/zsh/manjaro-zsh-prompt
	install -D -m644 ${srcdir}/${_pkgname}/zsh-maia-prompt ${pkgdir}/usr/share/zsh/zsh-maia-prompt
	install -D -m644 ${srcdir}/${_pkgname}/p10k.zsh ${pkgdir}/usr/share/zsh/p10k.zsh
	install -D -m644 ${srcdir}/${_pkgname}/p10k-portable.zsh ${pkgdir}/usr/share/zsh/p10k-portable.zsh
	install -D -m644 ${srcdir}/${_pkgname}/command-not-found.zsh ${pkgdir}/usr/share/zsh/functions/command-not-found.zsh
	install -D -m640 ${srcdir}/${_pkgname}/rootzshrc ${pkgdir}/root/.zshrc
	chmod 750 ${pkgdir}/root
	mkdir -p ${pkgdir}/usr/share/zsh/scripts
	cp -r ${srcdir}/${_pkgname}/base16-shell ${pkgdir}/usr/share/zsh/scripts
	chmod a+x ${pkgdir}/usr/share/zsh/scripts/base16-shell/*
}

