# Maintainer: Pablo Alessandro Santos Hugen <PabloASHugen@protonmail.com>
pkgname="vscode-bash-debug"
pkgver="0.3.0"
pkgrel="1"
pkgdesc="Bash shell debugger extension for VSCode (based on bashdb)"
arch=(any)
url="https://github.com/rogalmic/vscode-bash-debug"
license=(MIT)
depends=(bun)
makedepends=(
    git
    bun
    typescript
)
source=("git+$url.git")
sha256sums=('SKIP')

build() {
    cd $pkgname || exit
    bun i
    tsc -p ./src
}

package() {
    sed -i '1i #!/usr/bin/env bun' "$pkgname/out/bashDebug.js"
    chmod +x "$pkgname/out/bashDebug.js"

    install -d "$pkgdir/usr/share/$pkgname"
    cp -r "$pkgname/out" "$pkgdir/usr/share/$pkgname/out"

    install -D -m 644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/share/$pkgname/out/bashDebug.js" "$pkgdir/usr/bin/vscode-bash-debug"
}
