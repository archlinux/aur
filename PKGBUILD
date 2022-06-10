#!/usr/bin/env bash

# Maintainer: zenekron <zenekron@gmail.com>

# https://github.com/koalaman/shellcheck/issues/2356
declare pkgdir

export pkgname="gradle-language-server"
export pkgver="3.12.1"
export pkgrel="1"
export epoch=
export pkgdesc="Microsoft's Gradle language server"
export url="https://github.com/microsoft/vscode-gradle"
export license=('custom:MIT')
export install=
export changelog=
export source=("https://github.com/microsoft/vscode-gradle/releases/download/$pkgver/vscjava.vscode-gradle-$pkgver.vsix")
export validpgpkeys=()
export noextract=()
export md5sums=("SKIP")
export groups=()
export arch=("any")
export backup=()
export depends=("java-runtime")
export makedepends=()
export checkdepends=()
export optdepends=()
export conflicts=()
export provides=("gradle-language-server")
export replaces=()
export options=()

_ls_jar='extension/lib/gradle-language-server.jar'

check() {
	local payload='{"jsonrpc":"2.0","id":1,"method":"exit","params":{}}'
	local message="Content-Length: ${#payload}\r\n\r\n${payload}"
	timeout 10s bash -c "echo -ne '$message' | java -jar '$_ls_jar'"
	exec test $? -eq 0
}

package() {
	install -Dm 644 "$_ls_jar" "$pkgdir/usr/share/java/gradle-language-server.jar"
	install -Dm 644 "extension/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
