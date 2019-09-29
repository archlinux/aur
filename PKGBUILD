# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Yifan Xu <jamesxu182@gmail.com>
pkgname=jenkinsfile-runner-git
_pkgname=jenkinsfile-runner
pkgver=r281.552a0a2
pkgrel=1
epoch=
pkgdesc="A command line tool to run Jenkinsfile"
arch=("i686" "x86_64")
url="https://github.com/jenkinsci/jenkinsfile-runner.git"
license=('MIT')
depends=('java-runtime-headless=8')
makedepends=('maven')
conflicts=('jenkinsfile-runner')
source=("${pkgname%-*}::git+https://github.com/jenkinsci/jenkinsfile-runner.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
    mvn package
}

package() {
	cd "$srcdir"/"$_pkgname"
    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/share/java/"$_pkgname"
    mkdir -p "$pkgdir"/usr/share/licenses/"$_pkgname"
    cp -r app/target/* "$pkgdir"/usr/share/java/"$_pkgname"/ 
    install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/"$_pkgname"/
    ln -s /usr/share/java/${_pkgname}/appassembler/bin/"$_pkgname" "$pkgdir"/usr/bin
}
