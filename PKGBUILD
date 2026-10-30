# Maintainer: agony <27015 at riseup dot net>

pkgname=webdav-bin
pkgver=5.17.3
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
sha256sums_x86_64=('a992c55638e00e345ebf1b065f1f70b04450905868327c0bc1c6ea1822ba4cbe')
sha256sums_aarch64=('62ffe5798ece015d51a181348edff188807467a76e9bf6eac696932833f88b58')
sha256sums_armv7h=('b3efa5910058795729f82252f21e23aad0fc31f4f6220caf0367603c058fa08a')
sha256sums_armv6h=('8733eccc78df85a0925610a4d9e82c772e12057c1678c10f12b929ac01f4bb46')
sha256sums_i686=('a3db6d66226b7ce0f08188ed410d9de6ace3d64117a3f52cb20c83790902e91a')

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
