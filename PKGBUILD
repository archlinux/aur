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
pkgver=1.11.8
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
_commit="717e18b"
source=("git+$_ghurl.git#commit=$_commit")
sha256sums=('ef4b2b941e5d91297400569649acaae635a4733fa60ee8fe1145a43b1e70e7df')

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
