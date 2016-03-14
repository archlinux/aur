# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor:  jyantis <yantis@yantis.net>

pkgname=oh-my-zsh-powerlevel9k-theme-git
_pkgname=powerlevel9k
pkgver=v0.3.1.r0.g472fb6f
pkgrel=1
pkgdesc='oh-my-zsh Powerlevel9k theme'
arch=('any')
url='https://github.com/bhilburn/powerlevel9k'
license=('custom')
depends=('zsh' 'oh-my-zsh-git')
source=("${_pkgname}::git+https://github.com/bhilburn/${_pkgname}.git")
sha256sums=('SKIP')
makedepends=('git')
provides=('oh-my-zsh-powerlevel9k-theme')
conflicts=('oh-my-zsh-powerlevel9k-theme')
install='oh-my-zsh-powerlevel9k-theme.install'

pkgver()
{
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
	cd "${srcdir}/${_pkgname}"

	# No license
	# Install Readme as License in case in the future some type of license is added
	install -D -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Install Documentation
	install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Install the theme
	install -D -m644 powerlevel9k.zsh-theme "${pkgdir}/usr/share/oh-my-zsh/themes/powerlevel9k.zsh-theme"

	# Install the utilities
	for FILE in functions/*.zsh; do
		install -D -m644 "${FILE}" "${pkgdir}/usr/share/oh-my-zsh/themes/functions/$(basename ${FILE})"
	done
}
