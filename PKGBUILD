# Maintainer: Gontier Julien <gontierjulien68@gmail.com>

_name=firefox
_channel=nightly
_lang=en-US
pkgname=${_name}-${_channel}-every-day
pkgdesc="Standalone Web Browser from Mozilla — Nightly build (Updated every day) (${_lang})"
url="https://www.mozilla.org/${_lang}/${_name}/${_channel}"
_version=77.0a1
pkgver=77.0a1.20200415
pkgrel=2
arch=(i686 x86_64)
license=(MPL GPL LGPL)
depends=(dbus-glib gtk3 libxt nss mime-types)
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech'
            'startup-notification: support for FreeDesktop Startup Notification')
conflicts=('firefox-nightly')
_url="https://download-installer.cdn.mozilla.net/pub/${_name}/nightly/latest-mozilla-central"
_src="${_name}-${_version}.${_lang}.linux"
_filename="$(date +%Y%m%d)-${_src}"
source=("${_name}-${_channel}.desktop" 'policies.json')
source_i686=("${_filename}-i686.tar.bz2"::"${_url}/${_src}-i686.tar.bz2"
             "${_filename}-i686.tar.bz2.asc"::"${_url}/${_src}-i686.tar.bz2.asc"
             "${_filename}-i686.txt"::"${_url}/${_src}-i686.txt")
source_x86_64=("${_filename}-x86_64.tar.bz2"::"${_url}/${_src}-x86_64.tar.bz2"
               "${_filename}-x86_64.tar.bz2.asc"::"${_url}/${_src}-x86_64.tar.bz2.asc"
               "${_filename}-x86_64.txt"::"${_url}/${_src}-x86_64.txt")
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=(SKIP SKIP SKIP)
sha512sums_x86_64=(SKIP SKIP SKIP)
validpgpkeys=(14F26682D0916CDD81E37B6D61B7B526D98F0353) # Mozilla’s GnuPG release key

pkgver() {
  echo "${_version}.$(head -n1 ${_filename}-${CARCH}.txt | cut -c-8)"
}

package() {
  OPT_PATH="opt/${_name}-${_channel}"

  # Install the package files
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -r ${_name} "${pkgdir}"/${OPT_PATH}
  ln -s "/${OPT_PATH}/${_name}" "${pkgdir}"/usr/bin/${_name}-${_channel}

  # Install .desktop files
  install -Dm644 "${srcdir}"/${_name}-${_channel}.desktop -t "${pkgdir}"/usr/share/applications

  # Install icons
  SRC_LOC="${srcdir}"/${_name}/browser
  DEST_LOC="${pkgdir}"/usr/share/icons/hicolor
  for i in 16 32 48 64 128
  do
      install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}"/${i}x${i}/apps/${_name}-${_channel}.png
  done

  # Disable auto-updates
  install -Dm644 "${srcdir}"/policies.json -t "${pkgdir}"/${OPT_PATH}/distribution

  # Use system-provided dictionaries
  rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('43bb72dd5310e9afb779495b602f7400a467d65080698582a63e467bf9193ebda3e41259dd16161e221eb45399d24141fc0ded703ec3f719c850fdebeb1d665a'
                 'SKIP'
                 '14fc07f42ab44fa71c17d36603276988b8fac73ca500c8755d9a1ab9f91019e886f3eeb37d27711479334389f255b6a714dff85d7ce23b5dff32be91cb409df9')
sha512sums_x86_64=('3a880af1a57e98c4d96a3857a6f0b23f6bad59200f0a1bc2fa6c690099058f8baeff4cd0a9f1069dccc41a531768a04ef94d7de1d246620f39c1d8a06f7a4d4b'
                   'SKIP'
                   'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('43bb72dd5310e9afb779495b602f7400a467d65080698582a63e467bf9193ebda3e41259dd16161e221eb45399d24141fc0ded703ec3f719c850fdebeb1d665a'
                 'SKIP'
                 '14fc07f42ab44fa71c17d36603276988b8fac73ca500c8755d9a1ab9f91019e886f3eeb37d27711479334389f255b6a714dff85d7ce23b5dff32be91cb409df9')
sha512sums_x86_64=('3a880af1a57e98c4d96a3857a6f0b23f6bad59200f0a1bc2fa6c690099058f8baeff4cd0a9f1069dccc41a531768a04ef94d7de1d246620f39c1d8a06f7a4d4b'
                   'SKIP'
                   'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('43bb72dd5310e9afb779495b602f7400a467d65080698582a63e467bf9193ebda3e41259dd16161e221eb45399d24141fc0ded703ec3f719c850fdebeb1d665a'
                 'SKIP'
                 '14fc07f42ab44fa71c17d36603276988b8fac73ca500c8755d9a1ab9f91019e886f3eeb37d27711479334389f255b6a714dff85d7ce23b5dff32be91cb409df9')
sha512sums_x86_64=('3a880af1a57e98c4d96a3857a6f0b23f6bad59200f0a1bc2fa6c690099058f8baeff4cd0a9f1069dccc41a531768a04ef94d7de1d246620f39c1d8a06f7a4d4b'
                   'SKIP'
                   'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('15b1dffc3d2d03d8d24cc7ed7108ccc9bad77b1c981508e4a7f2b3ec2f300e5832d6ed7d74ec6576a691c6cf53e7d4c676df13f59efa61ec7a224cbaad8d3ef6'
                 'SKIP'
                 'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
sha512sums_x86_64=('3a880af1a57e98c4d96a3857a6f0b23f6bad59200f0a1bc2fa6c690099058f8baeff4cd0a9f1069dccc41a531768a04ef94d7de1d246620f39c1d8a06f7a4d4b'
                   'SKIP'
                   'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
