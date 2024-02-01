# Maintainer: Rasmus Moorats <xx+aur@nns.ee>

_java=17
_java_minor=+11.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=17.0.10
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${_java} version"
arch=('x86_64'
	'aarch64')
url='https://www.graalvm.org/'
license=('custom:OTN')
depends=('java-runtime-common'
	'java-environment-common')
makedepends=()
provides=("java-runtime=${_java}"
	"java-environment=${_java}")
options=('staticlibs')
install="$pkgname.install"
source=('graalvm-ee-rebuild-libpolyglot.hook')
sha256sums=('7dc37bd3703ebebcd6efa39534e6bb6e3ec9c8ee0d97e46d6df5349739c7d2ca')
sha256sums_x86_64=('112dc9b92d81a946f1b5b334646151b790785c813e76fcf13527a319003d7e2c')
sha256sums_aarch64=('c95ac550d070f06666cf8c1023a098380dd565be00866473caf6ff1b7cdf680c')
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
