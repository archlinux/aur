# Maintainer: MrHacker <david.munozm@proton.me>
pkgname=gpt-telegramus
pkgver=5.4.2
pkgrel=1
pkgdesc="GPT-Telegramus is a Telegram bot that allows you to interact with various large language models (LLMs), including ChatGPT, Bing AI (also known as Sidney or EdgeGPT), and Gemini."
arch=('x86_64')
url="https://github.com/F33RNI/GPT-Telegramus"
license=('AGPL-3.0-only')
depends=(
  'python'
  'python-virtualenv'
  )
provides=(gpt-telegramus)
conflicts=("gpt-telegramus-git")
backup=(
  "opt/gpt-telegramus/config.json"
  )
source_x86_64=(
  "https://github.com/F33RNI/GPT-Telegramus/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}.service"
  "${pkgver}.tar.gz.sig"
)
validpgpkeys=(
  '2B9D22B41F2AF1042BFCE73A3CA0B9DF1BE7CE09' #MrHacker GPGKey
)
sha256sums_x86_64=('e28aaee25825ee562f08ee4adadba0c2157cd0a28022d06bd42df32bbd9ec4f5'
                   '248424fe9c6d049786befbee00ebc270189d8afe16a2a4190d3cd127b3874156'
                   'SKIP')


package() {
  mkdir -p "$pkgdir/opt"
  tar xf "${pkgver}.tar.gz" -C "$pkgdir/opt/"
  mv "$pkgdir/opt/GPT-Telegramus-$pkgver" "$pkgdir/opt/gpt-telegramus" 
  install -Dm644 "gpt-telegramus.service" "$pkgdir/usr/lib/systemd/system/gpt-telegramus.service"
  cd "$pkgdir/opt/gpt-telegramus"
  chmod +x run.sh
  python -m venv venv
}
