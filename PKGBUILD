# Maintainer: rus364 <rus364@gmail.com>
pkgname=agent-box
pkgver=1.0.1
pkgrel=1
pkgdesc='Run coding agents in rootless Podman workspace boxes'
arch=('any')
url='https://github.com/rus364/agent-box'
license=('MIT')
depends=('python>=3.11' 'podman>=5' 'git')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('github-cli: forward GitHub authentication' 'tmux: detachable host sessions')
source=("agent_box_tool-1.0.1.tar.gz::$url/releases/download/v$pkgver/agent_box_tool-1.0.1.tar.gz")
sha256sums=('fc8b577b3780a93bad225db25ab828d6de02e7e4b9d472775b2ab9e05bccffd3')

build() {
  cd "agent_box_tool-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "agent_box_tool-$pkgver"
  python tests/run_suite.py
}

package() {
  cd "agent_box_tool-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
