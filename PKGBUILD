# Maintainer: MrHacker <david.munozm@proton.me>
pkgname=gpt-telegramus
pkgver=5.2.8
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
  "gpt-telegramus.service"
  "${pkgver}.tar.gz.sig"
)
validpgpkeys=(
  '2B9D22B41F2AF1042BFCE73A3CA0B9DF1BE7CE09' #MrHacker GPGKey
)
sha256sums_x86_64=('3f56c2c20b7395b3944507a52ee75f4a14e5284817fbda6744e28be8273520a5'
                   '248424fe9c6d049786befbee00ebc270189d8afe16a2a4190d3cd127b3874156'
                   'SKIP')


package() {
  # cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/opt"
  tar xf "${pkgver}.tar.gz" -C "$pkgdir/opt/"
  mv "$pkgdir/opt/GPT-Telegramus-$pkgver" "$pkgdir/opt/gpt-telegramus" 
  install -Dm644 "gpt-telegramus.service" "$pkgdir/usr/lib/systemd/system/gpt-telegramus.service"
  cd "$pkgdir/opt/gpt-telegramus"
  chmod +x run.sh
  python -m venv venv
}
