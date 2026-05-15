# Maintainer: Italo Alan <italoalanw3@gmail.com>
pkgname=claude-workspaces
pkgver=0.1.0
pkgrel=1
pkgdesc="Workspace manager pra lançar o Claude Code com contexto isolado por projeto"
arch=('any')
url="https://github.com/itaaloalan/claude-workspaces"
license=('MIT')
depends=(
    'python>=3.11'
    'pyside6'
    'python-pip'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'libnotify: notificações de fim de turno do Claude'
    'konsole: terminal padrão dos botões "Abrir Terminal"'
    'code: integração com VS Code'
    'intellij-idea-community-edition: integração com IntelliJ'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('933fe82345dd2de5ae0e3c91880599c0e895efa0552dfa071f07af4c4dc17fa2')
install="$pkgname.install"

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # .desktop launcher
    install -Dm644 "packaging/aur/claude-workspaces.desktop" \
        "$pkgdir/usr/share/applications/claude-workspaces.desktop"

    # ícone
    install -Dm644 "packaging/claude-workspaces.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/claude-workspaces.svg"

    # licença
    install -Dm644 "README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
