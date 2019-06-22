_pkgname=awj
pkgname=${_pkgname}-git
pkgver=r4.660fb41
pkgrel=3
pkgdesc='script that enables interactive selection and execution of aws-cli commands by using peco'
arch=('any')
url='https://github.com/daisuke-awaji/awj'
license=('MIT')
depends=('jq' 'peco' 'aws-cli')
provides=(${_pkgname})
source=('git+https://github.com/daisuke-awaji/awj.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    patch awj/awj ../PATCH
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 awj "${pkgdir}/usr/bin/awj"
    mkdir -p "${pkgdir}/usr/share/licenses/awj-git/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/awj-git/LICENSE"
}
