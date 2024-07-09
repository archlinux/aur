# Maintainer: lilikoi <jamilbio20@gmail.com>
pkgname='chatgpt.sh'
pkgver=0.63
pkgrel=1
_commit=439446030ba5545af3de6f2b62ce0351a18a108b
pkgdesc="Shell wrapper for OpenAI's ChatGPT, DALL-E, Whisper, and TTS. Features LocalAI, Ollama, Gemini and Mistral integration."
url='https://gitlab.com/fenixdragao/shellchatgpt'
arch=('any')
license=('GPL3')
depends=('bash' 'curl' 'jq')
makedepends=('git')
optdepends=(
	'imagemagick: edit input images'
	'xdg-utils: open images (xdg-open, open)'
	'sox: audio recorder (arecod, ffmpeg)'
	'mpv: audio player (sox, vlc, ffmpeg, afplay)'
	'xsel: copy output to clipboard (xclip)'
	'python: modules (tiktoken, markdown, bs4)'
	'bat: render markdown (pygmentize, glow, mdcat, mdless)'
	'w3m: dump url text (lynx, elinks, links)'
	'pdftotext: dump pdf as text (gs, abiword, ebook-convert)'
)
source=("${pkgname}-${pkgver}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	install -Dm644 "man/${pkgname}.txt" "$pkgdir/usr/share/doc/${pkgname}/${pkgname}.txt"
	install -Dm644 "man/${pkgname}.html" "$pkgdir/usr/share/doc/${pkgname}/${pkgname}.html"
	install -Dm644 ".chatgpt.conf" "$pkgdir/usr/share/doc/${pkgname}/chatgpt.conf"
	install -Dm644 "comp/bash/${pkgname}" "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
	install -Dm644 "comp/zsh/_${pkgname}" "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
	install -Dm644 "man/README.md" "$pkgdir/usr/share/doc/${pkgname}/${pkgname}.md"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
