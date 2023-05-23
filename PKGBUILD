# Maintainer: André Kugland <kugland at gmail dot com>

#  This package is provided as a workaround because ffsubsync
#  doesn't work correctly with the most recent version of its
#  libraries. In this package, it is installed, together with
#  its dependencies as a Python virtual environment inside the
#  directory /usr/share/ffsubsync-venv.

_pkgname=ffsubsync-venv
pkgname=python-$_pkgname
pkgver=0.4.22
pkgrel=1
pkgdesc="Language-agnostic automatic synchronization of subtitles with video. (Installed inside a Python virtual environment)"
arch=(any)
url="https://github.com/smacke/ffsubsync"
license=('MIT')
source=('ffs.sh')
sha256sums=('547f73f58ab3d7217b0ea211517d7ea7d0c76cbc49a1655ccd7be774ab57b396')
depends=('python-pip' 'python-setuptools' 'ffmpeg')
conflicts=('python-ffsubsync')
install=ffsubsync-venv.install

package() {
  mkdir -p "$pkgdir"/usr/{bin,share/ffsubsync-venv}
  install -m 755 -o 0 -g 0 ffs.sh "$pkgdir"/usr/bin/ffs
  install -m 755 -o 0 -g 0 ffs.sh "$pkgdir"/usr/bin/ffsubsync
  python -m venv --copies "$pkgdir/usr/share/ffsubsync-venv"
  sed -E -i -e "s,$pkgdir,,"g "$pkgdir/usr/share/ffsubsync-venv/bin"/{activate.csh,activate.fish,activate,pip3.11,pip3,pip} "$pkgdir"/usr/share/ffsubsync-venv/pyvenv.cfg
  . "$pkgdir/usr/share/ffsubsync-venv/bin/activate"
  pip install wheel
  pip install "ffsubsync==$pkgver"
  sed -E -i -e "s,$pkgdir,,"g "$pkgdir/usr/share/ffsubsync-venv/bin"/{auditok,chardetect,f2py3.11,f2py3,f2py,ffs,ffsubsync,futurize,markdown-it,normalizer,pasteurize,pygmentize,pysubs2,srt-deduplicate,srt-fixed-timeshift,srt,srt-linear-timeshift,srt-lines-matching,srt-mux,srt-normalise,srt-play,srt-process,subsync,tqdm,wheel}
}
