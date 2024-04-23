# Maintainer: MrHacker <david.munozm@proton.me>
_pkgname=GPT-Telegramus
pkgname=gpt-telegramus-git
pkgver=5.4.2.r0.ge8a3611
pkgrel=1
pkgdesc="GPT-Telegramus is a Telegram bot that allows you to interact with various large language models (LLMs), including ChatGPT, Bing AI (also known as Sidney or EdgeGPT), and Gemini."
url="https://github.com/F33RNI/GPT-Telegramus"
arch=(any)
license=('AGPL-3.0-only')
depends=(
  'python'
  'python-virtualenv'
  'bash'
  )
provides=("$_pkgname")
conflicts=("gpt-telegramus")
backup=(
  "opt/gpt-telegramus/config.json"
  )
source=(
  "${_pkgname}::git+https://github.com/F33RNI/$_pkgname.git"
  "gpt-telegramus.service"
)
validpgpkeys=(
  '2B9D22B41F2AF1042BFCE73A3CA0B9DF1BE7CE09' #MrHacker GPGKey
)
sha256sums=('SKIP'
            '248424fe9c6d049786befbee00ebc270189d8afe16a2a4190d3cd127b3874156')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "$pkgdir/opt"
  cd "$_pkgname"
  cp -r . "$pkgdir/opt/gpt-telegramus"
  cd ..
  install -Dm644 "gpt-telegramus.service" "$pkgdir/usr/lib/systemd/system/gpt-telegramus.service"
  cd "$pkgdir/opt/gpt-telegramus"
  chmod +x run.sh
  python -m venv venv
}
