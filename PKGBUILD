#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: radu242 <rbutoi@gmail.com>

pkgname=easymp3gain-qt4-bin
pkgver=0.5.0
pkgrel=8
pkgdesc="Qt Graphical User Interface (GUI) for MP3Gain, VorbisGain and AACGain (binary package)"
arch=('i686' 'x86_64')
url="http://easymp3gain.sourceforge.net/"
license=('GPL')
depends=('qt4' 'qt4pas')
optdepends=('mp3gain: for MP3 support'
            'vorbisgain: for OGG support'
            'aacgain: for AAC suport')
provides=('easymp3gain')
conflicts=('easymp3gain-gtk2' 'easymp3gain-gtk2-bin' 'easymp3gain-qt4')
install='easymp3gain.install'
source_i686=("https://sourceforge.net/projects/easymp3gain/files/easymp3gain%20i386/easymp3gain-${pkgver}/${pkgname%-bin}_${pkgver}_i386.tar.gz")
source_x86_64=("https://sourceforge.net/projects/easymp3gain/files/easymp3gain%20x86_64/easymp3gain-${pkgver}/${pkgname%-bin}_${pkgver}_amd64.tar.gz")
sha512sums_i686=('b862917898488d4a21a31c9a806695e6d32358775717de5246ffc8c8288603c3cc2bb726c8fcc9bfdf8e4d2ef8e2ec8b3208d577c1d2dcc42602bfde96bb6724')
sha512sums_x86_64=('e72e9afae3d02092042521faea4475093043ab96b3c95a57b31bed6bf016c6e647543c7f1b466b41494024943382081ab73225c89d67e8b207c6e5c86aeeb1a1')

package() {
  if [[ "${CARCH}" == "x86_64" ]]; then
    cd "${srcdir}/${pkgname%-bin}_${pkgver}-1_amd64/"
  else
    cd "${srcdir}/${pkgname%-bin}_${pkgver}-1_i386/"
  fi
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/doc"
  mkdir -p "${pkgdir}/usr/share/easymp3gain"

  cp easymp3gain "${pkgdir}/usr/bin/"
  cp -r applications "${pkgdir}/usr/share/"
  cp -r help "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  cp -r lang "${pkgdir}/usr/share/easymp3gain/"

  for i in 16 22 24 32 48 64 128 192; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
    cp -r icons/easymp3gain-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/easymp3gain.png
  done
}

# vim:set ts=2 sw=2 et:
