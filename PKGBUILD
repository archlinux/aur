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
pkgver=1.13.3
pkgrel=1
pkgdesc="The cutest Discord client mod"
arch=(any)
url=https://vencord.dev
_ghurl="https://github.com/Vencord/builds"
license=(GPL3)
makedepends=(
  unzip
)
_commit_sha="a2514fa7f5a25e97ade860294587c381ae2658d7"
source=(${pkgname}-${pkgver}.zip::$_ghurl/archive/$_commit_sha.zip)
sha256sums=('89f8c60ca9e598d7f4632de182828359fb239df4a30faad2f20c5953a9aeb66e')

package_vencord-bin() {
  depends=(vesktop)
  provides=(vencord)
  conflicts=(vencord)
  install=vencord.install
  
  cd "$srcdir"/${_dirname}-${_commit_sha}
  echo $pwd
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
  
  cd "$srcdir"/${_dirname}-${_commit_sha}
  unzip extension-chrome.zip -d extension-chrome
  install -dm755 "$pkgdir"/usr/lib/vencord-chromium
  cp -r -- extension-chrome/* "$pkgdir"/usr/lib/vencord-chromium
}

package_firefox-vencord-bin() {
  depends=(firefox)
  provides=(firefox-vencord)
  conflicts=(firefox-vencord)
  install=vencord.install

  cd "$srcdir"/${_dirname}-${_commit_sha}
  install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/firefox/browser/extensions/vencord-firefox@vendicated.dev.xpi
}

package_firefox-developer-edition-vencord-bin() {
  depends=(firefox-developer-edition)
  provides=(firefox-developer-edition-vencord)
  conflicts=(firefox-developer-edition-vencord)
  install=vencord.install

  cd "$srcdir"/${_dirname}-${_commit_sha}
  install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/firefox-developer-edition/browser/extensions/vencord-firefox@vendicated.dev.xpi
}

package_librewolf-vencord-bin() {
  depends=(librewolf)
  provides=(librewolf-vencord)
  conflicts=(librewolf-vencord)
  install=vencord.install

  cd "$srcdir"/${_dirname}-${_commit_sha}
  install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/librewolf/browser/extensions/vencord-firefox@vendicated.dev.xpi
}
