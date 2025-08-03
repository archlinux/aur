# Maintainer: justbispo <aur.fyxy0@slmail.me>
pkgname=(
  vencord-bin
  chromium-vencord-bin
  firefox-vencord-bin
  firefox-developer-edition-vencord-bin
  librewolf-vencord-bin
)
pkgbase=vencord-bin
_dirname=builds
pkgver=1.12.9
pkgrel=1
pkgdesc="The cutest Discord client mod"
arch=(any)
url=https://vencord.dev
_ghurl="https://github.com/Vencord/builds"
license=(GPL3)
makedepends=(
  git
  unzip
)
_commit="efe8a16"
source=("git+$_ghurl.git#commit=$_commit")
sha256sums=('8c0811ea98df444000dca19c143a0594d582aafae1d82ce5554b580ece4ee6c0')

package_vencord-bin() {
  depends=(vesktop)
  provides=(vencord)
  conflicts=(vencord)
  install=vencord.install
  
  cd "$srcdir"/$_dirname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/vencord/LICENSE
  install -d "$pkgdir"/usr/lib/vencord
  cp -r -- vencord* preload* patcher* renderer* "$pkgdir"/usr/lib/vencord
}

package_chromium-vencord-bin() {
  pkgdesc+=' (unpacked webextension)'
  optdepends=(chromium vivaldi google-chrome opera brave ungoogled-chromium)
  provides=(chromium-vencord)
  conflicts=(chromium-vencord)
  install=vencord.install
  
  cd "$srcdir"/$_dirname
  unzip extension-chrome.zip -d extension-chrome
  install -dm755 "$pkgdir"/usr/lib/vencord-chromium
  cp -r -- extension-chrome/* "$pkgdir"/usr/lib/vencord-chromium
}

package_firefox-vencord-bin() {
  depends=(firefox)
  provides=(firefox-vencord)
  conflicts=(firefox-vencord)
  install=vencord.install

  cd "$srcdir"/$_dirname
  install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/firefox/browser/extensions/vencord-firefox@vendicated.dev.xpi
}

package_firefox-developer-edition-vencord-bin() {
  depends=(firefox-developer-edition)
  provides=(firefox-developer-edition-vencord)
  conflicts=(firefox-developer-edition-vencord)
  install=vencord.install

  cd "$srcdir"/$_dirname
  install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/firefox-developer-edition/browser/extensions/vencord-firefox@vendicated.dev.xpi
}

package_librewolf-vencord-bin() {
  depends=(librewolf)
  provides=(librewolf-vencord)
  conflicts=(librewolf-vencord)
  install=vencord.install

  cd "$srcdir"/$_dirname
  install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/librewolf/browser/extensions/vencord-firefox@vendicated.dev.xpi
}
