pkgname=python-ocp-vscode
_name=ocp_vscode
pkgdesc="OCP CAD Viewer for VSCode (also for Jupyter and standalone)"
pkgver=3.1.2
pkgrel=1
arch=('any')
url="https://github.com/bernhard-42/vscode-ocp-cad-viewer"
license=('Apache-2.0')
depends=('python-ocp-tessellate' 'python-requests' 'python-ipykernel' 'python-orjson'
    'python-websockets' 'python-pyaml' 'python-flask' 'python-flask-sock' 'python-click'
    'python-pyperclip' 'python-questionary')
makedepends=('python-build' 'python-installer' 'python-wheel')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/o/$_name/$_name-$pkgver.tar.gz"
    "ocp-vscode")
sha256sums=('540f66f26c13249a698a0032eaa869f6675ec71ab34c293c5a084b4cf00ec376'
            '4fd564ab59d38072be61cfa5159a297e7222879265ffea94684296bfe550aa26')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation

}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    # install python executable to simplify running as standalone
    install -Dm755 -t "$pkgdir/usr/bin" "../ocp-vscode"
}

# The test files aren't actually using pytest, and fail to load
#check() {
#    cd $_name-$pkgver
#    pytest
#}
