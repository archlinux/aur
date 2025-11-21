# Maintainer: Kanishk Mishra <kanishk.kumar412@example.com>

pkgname=notionsafe
pkgver=0.1.0
pkgrel=1
pkgdesc="A cross-platform desktop app to backup Notion workspaces locally."
arch=('any')
url="https://github.com/KanishkMishra143/NotionSafe"
license=('MIT')
depends=('python-notion-client' 'python-notion2md' 'python-requests' 'python-gitpython' 'python-python-dotenv' 'python-keyring' 'python-pyyaml' 'python-sqlalchemy' 'python-dateutil' 'python-tqdm' 'python-psutil' 'python-rich' 'python-schedule' 'python-gobject' 'git')
makedepends=('python-setuptools' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KanishkMishra143/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1da8832f0b1aa82cb30ede62672c5f34d0e9ed67e42520c54de65e3f032fd650')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pip install --root="${pkgdir}" --break-system-packages --no-deps dist/*.whl

  # Install desktop file and icon
  install -D -m644 notionsafe.desktop "${pkgdir}/usr/share/applications/notionsafe.desktop"
  install -D -m644 assets/logo.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/notionsafe.png"
}
