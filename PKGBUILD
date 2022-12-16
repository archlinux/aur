# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Jean Lucas <jean@4ray.co>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=hunter
pkgver=1.3.5
pkgrel=3
pkgdesc='Ranger-like CLI file browser written in Rust'
arch=('i686' 'x86_64')
url='https://github.com/nanoctr/hunter'
license=('custom:WTFPL')
provides=('hunter')
depends=('gst-plugins-base-libs' 'libsixel')
makedepends=('git'
	     'rustup'
             'gst-plugins-good'
             'gst-plugins-bad'
             'gst-plugins-ugly')
optdepends=('gst-plugins-good: Media support'
            'gst-plugins-bad: Media support'
            'gst-plugins-ugly: Media support'
            'gst-libav: Media support'
            'nerd-fonts-complete: Icon pack support'
            'bat: Syntax highlighting'
            'highlight: Syntax highlighting'
            'libarchive: Archive support'
            'p7zip: Archive support'
            'atool: Archive support'
            'w3m: HTML support'
            'links: HTML support'
            'elinks: HTML support'
            'lynx: HTML support'
            'poppler: PDF support'
            'mupdf-tools: PDF support'
            'fzf: Default file finder')
source=("git+${url}.git#commit=17946cf")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  rustup override set nightly
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D target/release/hunter{,-media} -t "${pkgdir}"/usr/bin
  install -Dm644 README.md -t "${pkgdir}"/usr/share/doc/hunter
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/hunter
}
