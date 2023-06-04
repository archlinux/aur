# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgname=gitlab-sans-otf-git
pkgver=r50.a912c38
pkgrel=1
pkgdesc="Gitlab's sans-serif typeface based on Inter."
arch=('any')
url="https://gitlab-org.gitlab.io/frontend/fonts"
license=('custom:OFL')
makedepends=("python-pdm" "jq")
source=("gitlab-fonts::git+https://gitlab.com/gitlab-org/frontend/fonts.git")

pkgver() {
    cd gitlab-fonts
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd gitlab-fonts
	make gitlab-sans
}


package() {
	cd gitlab-fonts/gitlab-sans
	install -Ddm755 ${pkgdir}/usr/share/fonts/gitlab-fonts
	install -Ddm755 ${pkgdir}/usr/share/fonts/gitlab-fonts/gitlab-sans
	install -Dm0644 *.otf ${pkgdir}/usr/share/fonts/gitlab-fonts/gitlab-sans/
	install -Dm0644 LICENSE.txt ${pkgdir}/usr/share/licenses/gitlab-sans-otf-git/LICENSE.txt
}

sha256sums=('SKIP')
