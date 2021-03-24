# Maintainer: SZanko <szanko at protonmail dot org>

_name=dvc
pkgname=$_name-bin
pkgver=2.0.9
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
sha256sums=('f38af10908f7b1bbd7f7bc79944341808e2ba59a3f3d4d0cf2e5a8eb11f8c07c')


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
