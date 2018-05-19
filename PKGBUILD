# Maintainer: Edmund Wu <fangkazuto@gmail.com>

pkgname=kother-meta
pkgver=1.0.0
pkgrel=1
pkgdesc='Other packages'
arch=('x86_64')
url='https://gitlab.com/eadwu/pkgbuilds'
license=('custom:unknown')
depends=(
  'adapta-gtk-theme'
  'ark'
  'autopep8'
  'avahi'
  'blender'
  'broadcom-wl-dkms'
  'clang'
  'cmake'
  'cmatrix'
  'cmus'
  'conky'
  'cups'
  'cups-pdf'
  'deepin-gtk-theme'
  'devtools'
  'docker'
  'dotnet-host'
  'dotnet-runtime'
  'dotnet-sdk'
  'fcron'
  'feh'
  'ghc'
  'gimp'
  'git'
  'gitlab-runner'
  'glslang'
  'gnome-themes-extra'
  'gtk-engine-murrine'
  'gulp'
  'hplip'
  'htop'
  'hunspell-en'
  'hyphen-en'
  'java-environment-common'
  'java-runtime-common'
  'jdk8-openjdk'
  'jdk9-openjdk'
  'lib32-libpulse'
  'lib32-mesa'
  'libmythes'
  'libreoffice-fresh'
  'lm_sensors'
  'lsb-release'
  'luarocks'
  'maven'
  'mono'
  'mpd'
  'mythes-en'
  'ncmpcpp'
  'nodejs'
  'noto-fonts-cjk'
  'npm'
  'openssh'
  'openvpn'
  'p7zip'
  'pacutils'
  'pepper-flash'
  'perl-eval-closure'
  'perl-log-log4perl'
  'perl-namespace-autoclean'
  'perl-params-validationcompiler'
  'perl-specio'
  'perl-unicode-linebreak'
  'perl-yaml-tiny'
  'php'
  'powertop'
  'pycharm-community-edition'
  'python2-autopep8'
  'python2-google-api-python-client'
  'python2-pip'
  'python2-pylint'
  'python-beautifulsoup4'
  'python-fonttools'
  'python-google-api-python-client'
  'python-matplotlib'
  'python-pip'
  'python-pylint'
  'qt5-tools'
  'ranger'
  'rclone'
  'redshift'
  'rofi'
  'ruby'
  'ruby-sass'
  'rustup'
  'scrot'
  'simplescreenrecorder'
  'steam'
  'texlive-most'
  'tidy'
  'tlp'
  'ttf-liberation'
  'ttf-ubuntu-font-family'
  'unrar'
  'unzip'
  'vim'
  'vivaldi-snapshot'
  'vivaldi-snapshot-ffmpeg-codecs'
  'vlc'
  'wget'
  'wine'
  'wine_gecko'
  'wine-mono'
  'winetricks'
  'woff2'
  'xclip'
  'yarn'
  'youtube-dl'
  'zip'
  'zsh'
)

install () {
  install -Dm 0644 powertop.service "${pkgdir}/etc/systemd/system/powertop.service"
}

post_install () {
  perl -0777 -i -pe 's/hosts: (.+)(resolve \[!UNAVAIL=return\])(.+)\n/hosts: \1mdns_minimal \[NOTFOUND=return\] \2\3\n/' /etc/nsswitch.conf
  systemctl daemon-reload
  systemctl enable fcron
  systemctl enable fstrim.timer
  systemctl enable ntpd
  systemctl enable bluetooth
  systemctl enable org.cups.cupsd.service
  systemctl enable avahi-daemon.service
  systemctl enable docker
  systemctl enable lightdm.service
  systemctl enable NetworkManager
}
