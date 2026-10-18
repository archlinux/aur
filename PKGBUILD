pkgname=chaptarrng-bin
pkgver=0.9.977
pkgrel=1
pkgdesc='Standalone audiobook and ebook library manager'
arch=('x86_64')
options=('!debug')
url='https://github.com/snapetech/chaptarrng'
license=('GPL-3.0-only')
provides=('chaptarrng')
depends=('glibc' 'gcc-libs' 'icu' 'openssl' 'sqlite')
optdepends=('ffmpeg: audiobook conversion and chapter operations')
backup=()
install=chaptarrng.install
source=("https://github.com/snapetech/chaptarrng/releases/download/v${pkgver}/ChaptarrNG-${pkgver}-linux-x64.tar.gz"
        'chaptarrng.service'
        'chaptarrng.sysusers'
        'chaptarrng.tmpfiles'
        'chaptarrng.package_info'
        'chaptarrng.install')
sha256sums=('9e5e944dd112f77d569ce83018c1fc8f9a79fe048537f71eab28fb471e15e7f4' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  install -d "${pkgdir}/usr/lib/chaptarrng/bin" "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/lib/sysusers.d" "${pkgdir}/usr/lib/tmpfiles.d"
  tar -xzf "${srcdir}/ChaptarrNG-${pkgver}-linux-x64.tar.gz" --strip-components=1 -C "${pkgdir}/usr/lib/chaptarrng/bin"
  install -Dm644 "${srcdir}/chaptarrng.service" "${pkgdir}/usr/lib/systemd/system/chaptarrng.service"
  install -Dm644 "${srcdir}/chaptarrng.sysusers" "${pkgdir}/usr/lib/sysusers.d/chaptarrng.conf"
  install -Dm644 "${srcdir}/chaptarrng.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/chaptarrng.conf"
  install -Dm644 "${srcdir}/chaptarrng.package_info" "${pkgdir}/usr/lib/chaptarrng/package_info"
  install -Dm644 "${pkgdir}/usr/lib/chaptarrng/bin/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s ../lib/chaptarrng/bin/Chaptarr "${pkgdir}/usr/bin/chaptarrng"
  chmod -R u=rwX,go=rX "${pkgdir}/usr/lib/chaptarrng"
}
