# Maintainer: SZanko <szanko at protonmail dot org>

_name=dvc
pkgname=$_name-bin
pkgver=2.0.11
pkgrel=1
pkgdesc="Open-source version control system for data science projects as a binary"
arch=('x86_64')
url="https://github.com/iterative/dvc"
license=('APACHE')
conflicts=('dvc')
depends=('python' 'libarchive')
#makedepends=('rpm-tools')
optdepends=(
	'zsh-completions'
	'bash-completion'
)
source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-1.x86_64.rpm")
sha256sums=('98b416b1f08f268c46a406cfbe19f0e530620daf98ffe9e79ac9a850380b1c58')

package() {
	cd $srcdir
    # install -Dm755 -t ${pkgdir}/usr/bin usr/bin/dvc
	mkdir -p ${pkgdir}/usr/lib/dvc
	cp -R usr/lib ${pkgdir}/usr/lib/dvc
	cp -R usr/bin ${pkgdir}/usr/lib/dvc
	chmod -R 755 ${pkgdir}/usr/lib/dvc
	install -Dm644 -t ${pkgdir}/usr/share/zsh/site-functions usr/share/zsh/site-functions/_dvc/_dvc
	install -Dm644 -t ${pkgdir}/etc/bash_completion.d etc/bash_completion.d/dvc
	mkdir ${pkgdir}/usr/bin
	ln -s /usr/lib/dvc/bin/dvc ${pkgdir}/usr/bin/dvc
}
