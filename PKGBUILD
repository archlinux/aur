# Maintainer: justbrowsing <developer4linux+aur@gmail.com> 
pkgname=justbrowsing-webapps
pkgver=2.7
pkgrel=1
pkgdesc="Web-apps for JustBrowsing: calculator, notes, timers, wageclock"
arch=('any')
url="https://github.com/justbrowsing/justbrowsing"
depends=()
makedepends=('git')
optdepends=('firefox: web browser' 'chromium: web browser')
license=('custom' 'CCPL' 'MIT')
groups=("justbrowsing")
install=webapps.install
 
_calculatorURL='https://github.com/justbrowsing/justbrowsing-calculator.git'
_calculator='justbrowsing-calculator'
_emailURL='https://github.com/justbrowsing/justbrowsing-email.git'
_email='justbrowsing-email'
_notesURL='https://github.com/justbrowsing/justbrowsing-notes.git'
_notes='justbrowsing-notes'
_timersURL='https://github.com/justbrowsing/justbrowsing-timers.git'
_timers='justbrowsing-timers'
_wageclockURL='https://github.com/justbrowsing/justbrowsing-wageclock.git'
_wageclock='justbrowsing-wageclock'

build() {
    # Calculator web-app
    cd "$srcdir"
    msg "Connecting to github GIT server...."
    if [ -d "$srcdir/$_calculator" ] ; then
        cd $_calculator && git pull origin
    else
        git clone "$_calculatorURL"
        cd $_calculator
    fi

    # Email web-app
    cd "$srcdir"
    msg "Connecting to github GIT server...."    
    if [ -d "$srcdir/$_email" ] ; then
        cd $_email && git pull origin
    else
        git clone "$_emailURL"
        cd $_email
    fi

    # Notes web-app
    cd "$srcdir"
    msg "Connecting to github GIT server...."
    if [ -d "$srcdir/$_notes" ] ; then
        cd $_notes && git pull origin
    else
        git clone "$_notesURL"
        cd $_notes
    fi
    
    # Timers web-app
    cd "$srcdir"
    msg "Connecting to github GIT server...."    
    if [ -d "$srcdir/$_timers" ] ; then
        cd $_timers && git pull origin
    else
        git clone "$_timersURL"
        cd $_timers
    fi

    # Wageclock web-app
    cd "$srcdir"  
    msg "Connecting to github GIT server...."   
    if [ -d "$srcdir/$_wageclock" ] ; then
        cd $_wageclock && git pull origin
    else
        git clone "$_wageclockURL"
        cd $_wageclock
    fi
}

package() {
    # Calculator web-app
    cd "$srcdir/$_calculator"
    mkdir -p $pkgdir/apps/calc
    install -m444 *.css $pkgdir/apps/calc/
    install -m444 *.html $pkgdir/apps/calc/
    install -m444 *.ico $pkgdir/apps/calc/
    install -m444 *.js $pkgdir/apps/calc/
    install -m444 *.png $pkgdir/apps/calc/
    install -m444 *.ttf $pkgdir/apps/calc/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname/calculator
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/calculator/LICENSE"

    # Email web-app
    cd "$srcdir/$_email"
    mkdir -p $pkgdir/apps/email
    install -m444 * $pkgdir/apps/email/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname/email
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/email/LICENSE"

    # Notes web-app
    cd "$srcdir/$_notes"
    mkdir -p $pkgdir/apps/notes/{css,img,js}
    mkdir -p $pkgdir/apps/notes/js/locales
    install -m444 *.html $pkgdir/apps/notes/
    install -m444 *.ico $pkgdir/apps/notes/
    install -m444 *.png $pkgdir/apps/notes/
    install -m444 css/*.css $pkgdir/apps/notes/css/
    install -m444 img/*.png $pkgdir/apps/notes/img/
    install -m444 js/*.js $pkgdir/apps/notes/js/
    install -m444 js/locales/*.js $pkgdir/apps/notes/js/locales/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname/notes
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/notes/LICENSE"

    # Timers web-app
    cd "$srcdir/$_timers"
    mkdir -p $pkgdir/apps/timers/sound
    install -m444 *.css $pkgdir/apps/timers/
    install -m444 *.html $pkgdir/apps/timers/
    install -m444 *.ico $pkgdir/apps/timers/
    install -m444 *.js $pkgdir/apps/timers/
    install -m444 *.png $pkgdir/apps/timers/
    install -m444 *.ttf $pkgdir/apps/timers/
    install -m444 sound/gong* $pkgdir/apps/timers/sound/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname/timers
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/timers/LICENSE"
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/audioalert
    install -D -m644 sound/LICENSE.audioalert "${pkgdir}/usr/share/licenses/${pkgname}/audioalert/LICENSE"

    # Wageclock web-app
    cd "$srcdir/$_wageclock"
    mkdir -p $pkgdir/apps/wageclock
    install -m444 * $pkgdir/apps/wageclock/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname/wageclock
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/wageclock/LICENSE"
}
