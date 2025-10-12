#!/bin/bash
# Maintainer: 3bd <3bd3bdr@gmail.com>
# Mindcode Mlog Compiler

pkgname=mindcode-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="Mindcode/Schemacode command-line compiler"
arch=('any')
url="https://github.com/cardillan/mindcode"
license=('MIT')
provides=(mindcode)
depends=('jre-openjdk>=24.0')
source=("https://github.com/cardillan/mindcode/releases/download/v$pkgver/mindcode.jar")
sha512sums=('cf59ccdf547a8258f72ecc7fd8957f5fa6b5c134b3e3fb1ab73204b5f8b79709f67faed09bcfb45c9e599004de7b03dcb234b4205c5f360e599090c398bb294d')

build(){ :; }

package(){
	mkdir -p -- "$pkgdir"/usr/bin "$pkgdir"/usr/share/java/mindcode
	cp -- mindcode.jar "$pkgdir"/usr/share/java/mindcode/
	cat >"$pkgdir"/usr/bin/mindcode <<-'EOF'
		#!/bin/sh --
		exec /usr/lib/jvm/java-24-openjdk/bin/java -jar /usr/share/java/mindcode/mindcode.jar "$@"
	EOF
	chmod +x "$pkgdir"/usr/bin/mindcode
	mkdir -p -- "$pkgdir"/usr/share/licenses/mindcode-bin
	cat >"$pkgdir"/usr/share/licenses/mindcode-bin/LICENSE <<-'EOF'
		Copyright (c) 2021 François Beausoleil <francois@teksol.info>
		Copyright (c) 2023-2025 Cardillan (https://github.com/cardillan)

		Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

		The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	EOF
}
