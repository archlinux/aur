# Maintainer: Ronald Record <ronaldrecord@gmail.com>

pkgname=asciiville
pkgver=v3.0.1r2
pkgrel=1
pkgdesc="Create and display ASCII Art, animations. Utilities to perform common operations in a character-based environment. Asciiville includes nearly 1,000 works of ASCII Art"
arch=('any')
url="https://github.com/doctorfree/Asciiville"
license=('MIT')
depends=(util-linux libcurl-compat ncurses readline dialog figlet tmux python python-pip mplayer dconf w3m ranger curl jq wget asciinema speedtest-cli neofetch neomutt newsboat imagemagick libjpeg-turbo libpng cmatrix gnupg khard git)
makedepends=(zip)
optdepends=('cool-retro-term: cool retro terminal emulator')
install=asciiville.install
source=("${pkgname}::git+https://github.com/doctorfree/Asciiville.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}"
  destdir=usr

  for dir in "usr" "${destdir}" "${destdir}/share" "${destdir}/share/man" \
      "${destdir}/share/applications" "${destdir}/share/doc" \
      "${destdir}/share/doc/${pkgname}" \
      "${destdir}/share/${pkgname}"
  do
    [ -d ${pkgdir}/${dir} ] || mkdir ${pkgdir}/${dir}
  done

  for dir in bin
  do
    [ -d ${pkgdir}/${destdir}/${dir} ] && rm -rf ${pkgdir}/${destdir}/${dir}
  done

  cp -a bin ${pkgdir}/${destdir}/bin

  cp *.desktop "${pkgdir}/${destdir}/share/applications"
  cp -a conf/btop ${pkgdir}/${destdir}/share/${pkgname}/btop
  cp -a conf/console ${pkgdir}/${destdir}/share/${pkgname}/console
  cp -a conf/got ${pkgdir}/${destdir}/share/${pkgname}/got
  cp -a conf/jrnl ${pkgdir}/${destdir}/share/${pkgname}/jrnl
  cp -a conf/khard ${pkgdir}/${destdir}/share/${pkgname}/khard
  cp -a conf/kitty ${pkgdir}/${destdir}/share/${pkgname}/kitty
  cp -a conf/mutt ${pkgdir}/${destdir}/share/${pkgname}/mutt
  cp -a conf/mutt_multiple ${pkgdir}/${destdir}/share/${pkgname}/mutt_multiple
  cp -a conf/neomutt ${pkgdir}/${destdir}/share/${pkgname}/neomutt
  cp -a conf/newsboat ${pkgdir}/${destdir}/share/${pkgname}/newsboat
  cp -a conf/w3m ${pkgdir}/${destdir}/share/${pkgname}/w3m
  cp -a conf/tuir ${pkgdir}/${destdir}/share/${pkgname}/tuir
  cp conf/tmux.conf ${pkgdir}/${destdir}/share/${pkgname}
  cp conf/rifle.conf ${pkgdir}/${destdir}/share/${pkgname}
  cp conf/rainbow_config.json ${pkgdir}/${destdir}/share/${pkgname}
  cp copyright ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp LICENSE ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp CHANGELOG.md ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp README.md ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp VERSION ${pkgdir}/${destdir}/share/doc/${pkgname}
  gzip -9 ${pkgdir}/${destdir}/share/doc/${pkgname}/CHANGELOG.md

  cp -a art "${pkgdir}/${destdir}/share/${pkgname}/art"
  mv "${pkgdir}/${destdir}/share/${pkgname}/art/pics" \
     "${pkgdir}/${destdir}/share/${pkgname}/pics"
  cp -a music "${pkgdir}/${destdir}/share/${pkgname}/music"
  cp -a tools "${pkgdir}/${destdir}/share/${pkgname}/tools"

  gzip ${pkgdir}/${destdir}/share/${pkgname}/art/*/*.asc

  cp -a man/man1 ${pkgdir}/${destdir}/share/man/man1

  cp -a share/menu "${pkgdir}/${destdir}/share/menu"
  cp -a share/figlet-fonts "${pkgdir}/${destdir}/share/figlet-fonts"
  cp -a share/neofetch-themes "${pkgdir}/${destdir}/share/neofetch-themes"

  [ -d ${pkgdir}/usr/share ] || mkdir -p ${pkgdir}/usr/share
  [ "${destdir}" == "usr" ] || {
    mv ${pkgdir}/${destdir}/share/man ${pkgdir}/usr/share
  }
  chmod 644 ${pkgdir}/usr/share/man/*/*
  chmod 644 ${pkgdir}/${destdir}/share/menu/*
  chmod 644 ${pkgdir}/${destdir}/share/figlet-fonts/*
  chmod 755 ${pkgdir}/${destdir}/bin/* \
            ${pkgdir}/${destdir}/bin \
            ${pkgdir}/${destdir}/share/asciiville/newsboat/*.sh \
            ${pkgdir}/${destdir}/share/asciiville/newsboat/scripts/*.sh \
            ${pkgdir}/${destdir}/share/menu \
            ${pkgdir}/${destdir}/share/figlet-fonts \
            ${pkgdir}/usr/share/man \
            ${pkgdir}/usr/share/man/*
  find ${pkgdir}/${destdir}/share/doc/${pkgname} -type d | while read dir
  do
    chmod 755 "${dir}"
  done
  find ${pkgdir}/${destdir}/share/doc/${pkgname} -type f | while read f
  do
    chmod 644 "${f}"
  done
  find ${pkgdir}/${destdir}/share/${pkgname} -type d | while read dir
  do
    chmod 755 "${dir}"
  done
  find ${pkgdir}/${destdir}/share/${pkgname} -type f | while read f
  do
    chmod 644 "${f}"
  done
  chmod 755 ${pkgdir}/${destdir}/share/${pkgname}/tools/bin/*
}
