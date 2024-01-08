# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=plex-meta-manager
pkgver=1.20.0
pkgrel=1
pkgdesc='A powerful tool designed to give you complete control over your Plex media libraries.'
url='https://metamanager.wiki/'
arch=('any')
license=('MIT')
depends=(
  'python-arrapi'
  'python-gitpython'
  'python-lxml'
  'python-num2words'
  'python-pathvalidate'
  'python-pillow'
  'python-plexapi'
  'python-psutil'
  'python-dotenv'
  'python-requests'
  'python-retrying'
  'python-ruamel-yaml'
  'python-schedule'
  'python-tmdbapis'
)

makedepends=(
  'python-setuptools'
)

optdepends=(
  'plex-media-server'
)

backup=('etc/plexmetamanager/config.yml')

source=(
  "plexmetamanager-${pkgver}.tar.gz::https://github.com/meisnate12/Plex-Meta-Manager/archive/refs/tags/v${pkgver}.tar.gz"
  'plexmetamanager.service'
  'plexmetamanager.sysusers'
  'plexmetamanager.tmpfiles'
)
        
sha256sums=('3ffa3cbecd87b3984a04d99fc7abcd2f752b99cb8d3f2dbc21fcf756acdfc2af'
            '896036435c931410f961bd7b7ca7cc9d431a7b63e5ea14ab50cb5a5c3eebcf10'
            '5adcf312386776a66d4710496e0cbe63bc2e8f5ceb5ff1901cc3d5318a681d37'
            'a8e8020062d0985e51b0241b0dc1e54d9dae3999a03ec0966c4a69c53ae8a5a2')

package() {
  mkdir -p "${pkgdir}/etc/plexmetamanager/assets"
  install -D -m 644 "${srcdir}/Plex-Meta-Manager-${pkgver}/config/config.yml.template" "${pkgdir}/etc/plexmetamanager/config.yml"

  mkdir -p "${pkgdir}/usr/lib/plexmetamanager"
  cp -r "${srcdir}/Plex-Meta-Manager-${pkgver}/"* "${pkgdir}/usr/lib/plexmetamanager"

  find "${pkgdir}/usr/lib/plexmetamanager" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/lib/plexmetamanager" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/usr/lib/plexmetamanager/plex_meta_manager.py"

  install -D -m 644 "${srcdir}/plexmetamanager.service" "${pkgdir}/usr/lib/systemd/system/plexmetamanager.service"
  install -D -m 644 "${srcdir}/plexmetamanager.sysusers" "${pkgdir}/usr/lib/sysusers.d/plexmetamanager.conf"
  install -D -m 644 "${srcdir}/plexmetamanager.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/plexmetamanager.conf"
}
