pkgname=gitlab-cli
pkgver=1.30.0
pkgrel=1
pkgdesc="Perform GitLab actions on the CLI"
arch=('x86_64')
url="https://gitlab.com/gitlab-org/cli/"
license=('MIT')
source=("https://gitlab.com/gitlab-org/cli/-/releases/v${pkgver}/downloads/glab_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=('82f41e087c73f881fc397e8a6aae10f61403eb3058e9c60f871119080ff422d83b536e3a9ae79b23f30f310fd234704bf27835bf2b883481eb34cc978eb5ebba')

build() {
	# create completion scripts
	mkdir -p ${srcdir}/fish/vendor_completions.d/
	"${srcdir}/bin/glab" completion -s fish > ${srcdir}/fish/vendor_completions.d/glab.fish

	mkdir -p ${srcdir}/bash-completion/completions/
	"${srcdir}/bin/glab" completion -s bash > ${srcdir}/bash-completion/completions/glab

	mkdir -p ${srcdir}/zsh/site-functions/
	"${srcdir}/bin/glab" completion -s zsh > ${srcdir}/zsh/site-functions/_glab
}

package() {
	install -m644 -D "${srcdir}/fish/vendor_completions.d/glab.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/glab.fish"
	install -m644 -D "${srcdir}/bash-completion/completions/glab" "${pkgdir}/usr/share/bash-completion/completions/glab"
	install -m644 -D "${srcdir}/zsh/site-functions/_glab" "${pkgdir}/usr/share/zsh/site-functions/_glab"

	install -m755 -D "${srcdir}/bin/glab" "${pkgdir}/usr/bin/glab"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
