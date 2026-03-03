# Maintainer: Pedro dev <pedrolucasinvestidor.github@gmail.com>
# OLD.Maintainer: Radiolin <anton.osi2011@gmail.com>
#
# This PKGBUILD builds the 'alpaca-ai' application.
# Before attempting to build this package, ensure all AUR dependencies are installed.
pkgname=alpaca-ai
_pkgname=alpaca
pkgver=9.2.1
pkgrel=1
pkgdesc="An Ollama client. Chat with local AI models or connect to third party AI providers like ChatGPT , Gemini and more"
arch=(any) # 'any' is generally suitable for Python applications, but specific arch (e.g., 'x86_64') might be used if native components are present.
url="https://github.com/Jeffser/${_pkgname}" # Project URL, clarified to use _pkgname
license=(GPL-3.0-or-later)
options=(!debug) # Disable debug symbols for a smaller package

# Corrected source URL format for GitHub tags
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jeffser/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
b2sums=('f7f82089ed9c4a3bc759c19d30889435c356bc80e7e9e77d23fca1bd824d293215c6c2a322e0297645b92a170e8fa47e284a319dc648210555fdc6063425a383')

# List of runtime dependencies
depends=(
    dconf
    gdk-pixbuf2
    glib2
    gtk4
    gtksourceview5
    hicolor-icon-theme
    libadwaita
    libspelling
    pango
    python
    python-gobject
    python-html2text
    python-matplotlib
    python-odfpy
    python-openai              # AUR dependency
    python-pillow
    python-pydantic
    python-pydbus
    python-pyicu
    python-pypdf
    python-requests
    python-youtube-transcript-api # AUR dependency
    python-pyaudio
    python-openai-whisper
    vte4
    libvoikko
    nuspell
    hspell
    ollama
    python-markitdown          # AUR dependency (found during runtime error)
    python-mammoth             # AUR dependency (dependency of python-markitdown)
    python-markdownify         # AUR dependency (dependency of python-markitdown)
    python-pptx                # AUR dependency (dependency of python-markitdown)
    python-pydub               # AUR dependency (dependency of python-markitdown)
    python-speechrecognition   # AUR dependency (dependency of python-markitdown)
    python-pathvalidate        # AUR dependency (dependency of python-markitdown)
    python-cobble              # AUR dependency (dependency of python-markitdown)
    python-magika              # AUR dependency (dependency of python-markitdown)
    libportal
    python-opencv
    python-duckduckgo-search
    python-cairo
    gst-plugin-pipewire
    webkitgtk-6.0
    blueprint-compiler
)

# List of build-time dependencies
makedepends=(
    appstream
    desktop-file-utils
    gettext
    git
    meson
)


build() {
    # The extracted source directory is 'Alpaca-X.X.X' (with 'A' capitalized)
    # This path matches the actual directory created by tar.
    arch-meson "Alpaca-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
