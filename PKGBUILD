# Maintainer: agony <27015 at riseup dot net>

pkgname=webdav-bin
pkgver=5.17.2
pkgrel=1
pkgdesc='Standalone WebDAV server (prebuilt)'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'i686')
url='https://github.com/hacdias/webdav'
license=('MIT')
provides=("webdav=${pkgver}")
conflicts=('webdav')
backup=('etc/webdav/config.yml')
_release="${url}/releases/download/v${pkgver}"
source=('config.yml'
        'webdav.service'
        'webdav.sysusers'
        'webdav.tmpfiles')
source_x86_64=("webdav-${pkgver}-amd64.tar.gz::${_release}/linux-amd64-webdav.tar.gz")
source_aarch64=("webdav-${pkgver}-arm64.tar.gz::${_release}/linux-arm64-webdav.tar.gz")
source_armv7h=("webdav-${pkgver}-armv7.tar.gz::${_release}/linux-armv7-webdav.tar.gz")
source_armv6h=("webdav-${pkgver}-armv6.tar.gz::${_release}/linux-armv6-webdav.tar.gz")
source_i686=("webdav-${pkgver}-386.tar.gz::${_release}/linux-386-webdav.tar.gz")
sha256sums=('d178253eaf9dee6faad783ec9a1d61c0babca6ddced3216ee81957e05873b201'
            'f775c6ec0eb47472b7d7a13a10508b5aedf2fa7a92aeb4a8492484e64dd64b56'
            '2e6ceac8a2cbdd85ceb6ebbb7cae7d1ad00b14fc8a7e131da9c7ef573f3246e0'
            'f236c800ceb469bbb5fe003866f51881f07637ad940a39bf375804e725996642')
sha256sums_x86_64=('4166a2cc2999def4d280a6b03ff148193d4de848fbba927a54b94be69dcf2edf')
sha256sums_aarch64=('6723c54c579ff9d368ce8445a9471cb8267aa3432c6467c09471a5fbd5052991')
sha256sums_armv7h=('215f38fc317047c8b0d6d2cc59b332d15ed792c0ce9f77dc569e32556bbc0c47')
sha256sums_armv6h=('2c14f656eaed6b7fedc9647ec0c9393261685a12448e9a66e6133ef1dd2f8efd')
sha256sums_i686=('508d0081bba0e5b2e3ba0019f5426993b0902c5c1c94feaf73bef6623638de20')

build() {
  for shell in bash fish zsh; do
    ./webdav completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 webdav -t "${pkgdir}/usr/bin"
  install -Dm640 config.yml "${pkgdir}/etc/webdav/config.yml"
  install -Dm644 webdav.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 webdav.sysusers "${pkgdir}/usr/lib/sysusers.d/webdav.conf"
  install -Dm644 webdav.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/webdav.conf"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/webdav"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/webdav.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_webdav"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
