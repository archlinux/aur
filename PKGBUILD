# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="recyclarr"
pkgver=5.4.3
pkgrel=1
pkgdesc="A command-line application that will automatically synchronize recommended settings from the TRaSH guides to your Sonarr/Radarr instances."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/recyclarr/recyclarr"
license=('MIT')
options=('!strip' 'staticlibs')
depends=(
  'git'
)

optdepends=(
  'sonarr: Movie download automation for usenet and torrents.'
  'radarr: TV download automation for usenet and torrents.'
)

backup=('etc/recyclarr/recyclarr.yml')

source_x86_64=("recyclarr.${pkgver}.linux-x64.tar.gz::https://github.com/recyclarr/recyclarr/releases/download/v${pkgver}/recyclarr-linux-x64.tar.xz")
source_aarch64=("recyclarr.${pkgver}.linux-arm64.tar.gz::https://github.com/recyclarr/recyclarr/releases/download/v${pkgver}/recyclarr-linux-arm64.tar.xz")
source_armv7h=("recyclarr.${pkgver}.linux-arm.tar.gz::https://github.com/recyclarr/recyclarr/releases/download/v5.4.0/recyclarr-linux-arm.tar.xz")

source=(
  'recyclarr.service'
  'recyclarr.timer'
  'recyclarr.tmpfiles'
  'recyclarr.sysusers'
  'recyclarr.yml'
)
sha512sums=('165c6c181ccc671dbf781bc2ffba7267ebe02538d1af435446d3b166a9a739ad865031e9e4befc1ed8685a0d7e7fe8dfd343b913d21830d1cf5dbf12c5f5294f'
            'e6c6714cf82038b700421b17c96293a1cc045374c2efb3abd5d9f78c16e3e1a1b6f3858b10d07363381d137a09de242a639a084eee24a3f18fe1bd3b97cd5e48'
            'b26a7ebfe04bb6d15f94a423e844a546df7e3f767ecef0a39a74bc6affdb99a897075b2ef3e05c5514800d6e0f5f5afe02a9003852defc0091328171d9ebc3c1'
            '3eb0acff87af1553508c5da080a6767f204868dc33a6a5f2253d25164052ab8ba96f89c88ad4bb82227a0f3b7e172f692abfe84d3e9a800448b8f7e194304978'
            '87a9430a2dd4d14de36af0697342d7482585839b8ab66f8fa8da61f8965e145472554ba966a9d97692cf14332dd6fdb3a36d5daff14c1c868b7e6779c5d65c23')
sha512sums_x86_64=('34e8b3e4f49d21c8becb8f9f42e7d7e7e94c0f1691b131d7558e15d2c9414fd82687ed21fd638290adc5be8b9a0cd99f77fe6500e43260570d627e1c9a509ebf')
sha512sums_aarch64=('6f68d7e7fc3438d3110efcafe7f1806f59c0c115faa04cc8d22c5476dcff815a7cfde79d5d0a7ecb27d90a34c6aa59fc73ed658e71796ee74b9d369703ea6f09')
sha512sums_armv7h=('519231a286113d024fdf0d84abaf27af4f53a7a4e2cb36de122a0da2db0aaf1e499559e5524f5d827e118345dfd9ea175535a48d9b09ad62c7e5af1d8341c3db')



package() {
  install -D -m 755 "${srcdir}/recyclarr" "${pkgdir}/usr/bin/recyclarr"

  mkdir -p "${pkgdir}/etc/recyclarr"
  install -D -m 600 "${srcdir}/recyclarr.yml" "${pkgdir}/etc/recyclarr/recyclarr.yml"

  mkdir -p "${pkgdir}/var/lib/recyclarr"
  
  install -D -m 644 "${srcdir}/recyclarr.service" "${pkgdir}/usr/lib/systemd/system/recyclarr.service"
  install -D -m 644 "${srcdir}/recyclarr.timer" "${pkgdir}/usr/lib/systemd/system/recyclarr.timer"
  install -D -m 644 "${srcdir}/recyclarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/recyclarr.conf"
  install -D -m 644 "${srcdir}/recyclarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/recyclarr.conf"
}
