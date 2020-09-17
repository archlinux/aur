# Contributor: Greg White <gwhite@kupulau.com>
# Maintainer: Greg White <gwhite@kupulau.com>

pkgname=brave-nightly-bin
pkgver=1.16.23
pkgrel=4
pkgdesc='Web browser that blocks ads and trackers by default (nightly binary release).'
arch=('x86_64')
url='https://brave.com/download-nightly'
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
    	    'mesa: Hardware accelerated rendering'
	        'libglvnd: Support multiple different OpenGL drivers at any given time')
provides=("${pkgname}" 'brave-nightly-browser')
conflicts=("${pkgname}" 'brave-bin')
source=("$pkgname-$pkgver.deb::https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-nightly_${pkgver}_amd64.deb"
        'MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt'
        "$pkgname.sh"
        "$pkgname.desktop"
        "braveAbout.png")
options=(!strip)
sha512sums=('58ba2be4bf1db6fd902283b1ad45023416c02e59f4a0aac814aff4f124469b6b015e82a1aac341ab40da7b5ee5b8197fa2072401a71f4165a9e1c96ddb0dfd6d'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            '992579bed7178ffccc823c7e8efb4265f8b7650b9b1a2c69f4f39fcc0da19e00d55331b5efb37eea2818160ca256977e2076097fd6ae6cab4cbe1db1d6badb25'
            '86cf37b0dc8b37390da9341200af511721c8d2d81ccd45f565322271654058cf47680ae263cf5339feddd42d16bfce7f0aa824f2a45a7c446ed81fe6f749bb92'
            'd5ce90529c2b75357518ebde10e28e9d6f36efe21b705d7e48be07b1f320d739ef211c1bcc353aeefab3f27b7ba78793ebb74a204ac6c8efae855001b80de72a')
noextract=("$pkgname-$pkgver.zip")

# brave-browser-nightly_1.16.23_amd64.deb
# https://github.com/brave/brave-browser/releases/download/v1.16.23/brave-browser-nightly_1.16.23_amd64.deb

prepare() {
  mkdir -p brave
  cd brave
  ar x ../$pkgname-$pkgver.deb
  tar xf data.tar.xz
}


package() {
#    install -d -m0755 "$pkgdir/usr/lib"
    cp -a --reflink=auto brave/opt "$pkgdir/opt"
    cp -a --reflink=auto brave/usr "$pkgdir/usr"

    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave-nightly"
    install -Dm0644 -t "$pkgdir/usr/share/applications" "$pkgname.desktop"
    install -Dm0644 "braveAbout.png" "$pkgdir/usr/share/pixmaps/brave-nightly.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "MPL2"
}
