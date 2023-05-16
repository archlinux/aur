pkgname=gitlab-cli
pkgver=1.29.4
pkgrel=1
pkgdesc="Perform GitLab actions on the CLI"
arch=('x86_64')
url="https://gitlab.com/gitlab-org/cli/"
license=('MIT')
source=("https://gitlab.com/gitlab-org/cli/-/releases/v1.29.4/downloads/glab_1.29.4_Linux_x86_64.tar.gz")
sha512sums=('14bbe0789be9b2231491d8cf57f8025d69eed99402d98f2b1cdfed8837231f567fd4cf8918670dfc3527fc3325bfae73f71e6ff424d7cbff4a3fe5172dfe3f35')

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
