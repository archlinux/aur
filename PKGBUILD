# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=mkchromecast
pkgver=0.3.7.1
pkgrel=1
pkgdesc='Cast Audio/Video to your Google Cast and Sonos Devices'
arch=('any')
url="http://$pkgname.com"
license=('MIT')
depends=('faac' 'flac' 'gi' 'lame' 'python-flask' 'python-psutil'
         'python-pychromecast' 'sox' 'vorbis-tools')
makedepends=('python-setuptools')
optdepends=('alsa-utils: to cast with ALSA'
            'ffmpeg: for ffmpeg backend and/or to cast with ALSA'
            'gstreamer: for gstreamer backend'
            'nodejs: for node backend'
            'pavucontrol: to cast with PulseAudio'
            'pulseaudio: to cast with PulseAudio'
            'python-pyqt5: system tray menu support'
            'python-soco: Sonos support'
            'youtube-dl: YouTube support')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/muammar/$pkgname/archive/$pkgver.tar.gz"
        "https://raw.githubusercontent.com/muammar/$pkgname/8ec3f90c0f7231758fdddb704233db0edc8b8ef2/"{$pkgname.desktop,man/$pkgname.1})
sha512sums=('b2c0a5357915b66ff2fd9d0bf8d4e8f97e8d676de0ab4351235519b8df95b764e7adeecf5f8074ff2ead8f71c0cc3b260226113a4b1ae98f3263f657955bca6a'
            '7477ea47368d3105ef9e4ba6a44138d81bb494ae7f711e26626d3ecda740fb4d9805cc3dcedafa9aa4450d3be70ef2465ce9cc0cd5291ca94fa795a7c1537ab9'
            'f3d3e391d6f45ee37bafc600699388c533e202a28a529d23f058e9177f0c830daa89802892707fda0ed14667fae4060b24c44157b35ee000943f8c3a683c7e3e')

prepare() {
  cd $pkgname-$pkgver
  sed -i '170,171d' $pkgname/cast.py # Workaround minor TypeError exception
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/$pkgname/$pkgname.py "$pkgdir"/usr/bin/$pkgname

  install -Dm755 $pkgname.py "$pkgdir"/usr/share/$pkgname/$pkgname.py
  cp -a --parents images/google* $pkgname nodejs "$pkgdir"/usr/share/$pkgname

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 images/$pkgname.xpm "$pkgdir"/usr/share/pixmaps/$pkgname.xpm
  install -Dm644 ../$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}

# vim:set ts=2 sw=2 et:
