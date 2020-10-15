# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Yifan Xu <jamesxu182@gmail.com>
pkgname=jenkinsfile-runner-git
_pkgname=jenkinsfile-runner
pkgver=1.0.beta.18.r9.gcc0717b
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
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
    mvn clean package 
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
