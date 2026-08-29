# Maintainer: Chartic <contact@ch45.c01.kr>
pkgname=modlist-org-app
pkgver=0.4.7
pkgrel=1
pkgdesc="Mod manager and installer for A Dance of Fire and Ice (ADOFAI) and other games"
arch=('x86_64')
url="https://github.com/modlist-org/modlist_org_app"
license=('GPL-3.0-only')
depends=('gtk3' 'glib2')
makedepends=('flutter' 'git' 'cmake' 'ninja' 'clang' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/modlist-org/modlist_org_app/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "modlist_org_app-${pkgver}"
  flutter config --enable-linux-desktop
  flutter pub get
  flutter build linux --release
}

package() {
  cd "modlist_org_app-${pkgver}"

  # 실행 파일 및 번들 자원 설치
  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r build/linux/x64/release/bundle/* "${pkgdir}/usr/lib/${pkgname}/"

  # /usr/bin 심볼릭 링크 생성
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/modlist_org_app" "${pkgdir}/usr/bin/modlist-org-app"
}
