# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Tom v/d Brink <tomracing at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: ximeg <ximeg@tomcity.net>
# Maintainer: desperat <c2h5ohzh2@o2.pl>
# Maintainer: Mihai Coman <mihai@m1x.ro>
# Credits to: Jake <> for solving the server download definitions
# http://smath.info

pkgname=smath
pkgver=1_5_9678
pkgrel=1
pkgdesc="A mathematical program with many features and paper-like interface, similar to Mathcad"
_pkgcode=NKnL7
arch=('i686' 'x86_64')
url="http://smath.com"
license=('CCPL')
groups=('math')
depends=('mono')
install=smath.install
backup=(opt/$pkgname/settings.inf)
source=("https://smath.com/en-US/file/${_pkgcode}/SMathStudioDesktop.${pkgver}.Mono.tar.gz")
md5sums=('666168f21585a707431ab6c9a4e2451b')
DLAGENTS=("https::/usr/bin/wget --post-data RefMem=&PostBack=${_pkgcode} %u")

package() {
  cd "$srcdir"
  # install program
  install -m755 -d "$pkgdir"/opt/$pkgname/{book,examples,lang,entries,plugins,snippets}
  install -m755 -d "$pkgdir"/opt/$pkgname/plugins/{02f1ab51-215b-466e-a74d-5d8b1cf85e8d,06b5df04-393e-4be7-9107-305196fcb861,2814e667-4e12-48b1-8d51-194e480eabc5,485d28c5-349a-48b6-93be-12a35a1c1e39,4974b228-4974-44cf-8274-bf2936b4a766}
  install -m755 -d "$pkgdir"/opt/$pkgname/plugins/{89ec7a32-2a1f-4345-8f70-9a7fbcfd7812,8ec52daf-bcdb-4e5c-8e07-fade44a14e50,b0c79170-8f25-4115-97ae-f372f409e68c,c451c2b5-798b-4f08-b9ec-b90963d1ddaa,e1a5132a-4f6a-4518-972f-c35a8906be8c}
  install -m644 -t "$pkgdir"/opt/$pkgname/book book/*
  install -m644 -t "$pkgdir"/opt/$pkgname/examples examples/*
  install -m644 -t "$pkgdir"/opt/$pkgname/lang lang/*
  install -m644 -t "$pkgdir"/opt/$pkgname *.{dll,exe}
  install -m644 -t "$pkgdir"/opt/$pkgname/entries entries/*
  # install -m644 -t "$pkgdir"/opt/$pkgname/plugins plugins/*
  install -m644 -t "$pkgdir"/opt/$pkgname/plugins/02f1ab51-215b-466e-a74d-5d8b1cf85e8d plugins/02f1ab51-215b-466e-a74d-5d8b1cf85e8d/*
  install -m644 -t "$pkgdir"/opt/$pkgname/plugins/06b5df04-393e-4be7-9107-305196fcb861 plugins/06b5df04-393e-4be7-9107-305196fcb861/*
  install -m644 -t "$pkgdir"/opt/$pkgname/plugins/2814e667-4e12-48b1-8d51-194e480eabc5 plugins/2814e667-4e12-48b1-8d51-194e480eabc5/*
  install -m644 -t "$pkgdir"/opt/$pkgname/plugins/485d28c5-349a-48b6-93be-12a35a1c1e39 plugins/485d28c5-349a-48b6-93be-12a35a1c1e39/*
  install -m644 -t "$pkgdir"/opt/$pkgname/plugins/4974b228-4974-44cf-8274-bf2936b4a766 plugins/4974b228-4974-44cf-8274-bf2936b4a766/*
  install -m644 -t "$pkgdir"/opt/$pkgname/plugins/89ec7a32-2a1f-4345-8f70-9a7fbcfd7812 plugins/89ec7a32-2a1f-4345-8f70-9a7fbcfd7812/*
  install -m644 -t "$pkgdir"/opt/$pkgname/plugins/8ec52daf-bcdb-4e5c-8e07-fade44a14e50 plugins/8ec52daf-bcdb-4e5c-8e07-fade44a14e50/*
  install -m644 -t "$pkgdir"/opt/$pkgname/plugins/b0c79170-8f25-4115-97ae-f372f409e68c plugins/b0c79170-8f25-4115-97ae-f372f409e68c/*
  install -m644 -t "$pkgdir"/opt/$pkgname/plugins/c451c2b5-798b-4f08-b9ec-b90963d1ddaa plugins/c451c2b5-798b-4f08-b9ec-b90963d1ddaa/*
  install -m644 -t "$pkgdir"/opt/$pkgname/plugins/e1a5132a-4f6a-4518-972f-c35a8906be8c plugins/e1a5132a-4f6a-4518-972f-c35a8906be8c/*

  install -m644 -t "$pkgdir"/opt/$pkgname/snippets snippets/*

  # create settings file
  touch "$pkgdir"/opt/$pkgname/settings.inf
  chmod 664 "$pkgdir"/opt/$pkgname/settings.inf

echo "#!/bin/sh
cd /opt/smath
mono SMathStudio_Desktop.exe \"$@\"
" > ../$pkgname.sh

  # install launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "${startdir}/smath.desktop" "${pkgdir}/usr/share/applications/smath.desktop"
  install -Dm644 "${startdir}/SMathStudioLogo256.png" "${pkgdir}/usr/share/pixmaps/smath.png"

}
