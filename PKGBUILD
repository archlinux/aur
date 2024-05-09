# Maintainer: Rasmus Moorats <xx+aur@nns.ee>

_java=17
_java_minor=+7.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=17.0.11
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${_java} version"
arch=('x86_64'
	'aarch64')
url='https://www.graalvm.org/'
license=('CustomRef-GFTC')
depends=('java-runtime-common'
	'java-environment-common')
makedepends=()
provides=("java-runtime=${_java}"
	"java-environment=${_java}")
options=('staticlibs')
install="$pkgname.install"
source=('graalvm-ee-rebuild-libpolyglot.hook')
sha256sums=('7dc37bd3703ebebcd6efa39534e6bb6e3ec9c8ee0d97e46d6df5349739c7d2ca')
sha256sums_x86_64=('b7418747b3064990d2006797edbb08d738ae81a3f87ae45c26af9ca2f0c1518c')
sha256sums_aarch64=('d09fd76971b3372060c6b5b51e052fb4108f3d17c0bf3c0ec7aee9fd0718e2ed')
source_x86_64=("https://download.oracle.com/graalvm/${_java}/archive/graalvm-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://download.oracle.com/graalvm/${_java}/archive/graalvm-jdk-${pkgver}_linux-aarch64_bin.tar.gz")

package() {
	cd "graalvm-jdk-${pkgver}${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" *
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	sed "s/JAVA/${_java}/g" <"../graalvm-ee-rebuild-libpolyglot.hook" >"graalvm-ee-jdk${_java}-rebuild-libpolyglot.hook"
	install -DTm644 "graalvm-ee-jdk${_java}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-ee-jdk${_java}-rebuild-libpolyglot.hook"
}
